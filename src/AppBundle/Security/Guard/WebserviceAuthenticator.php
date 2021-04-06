<?php 

namespace AppBundle\Security\Guard;

use Pimcore\Tool\Authentication;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;

 

/**
 * Class WebserviceAuthenticator
 * @package VglBundle\Security\Guard
 */
class WebserviceAuthenticator extends \Pimcore\Bundle\AdminBundle\Security\Guard\WebserviceAuthenticator
{

    /**
     * @inheritDoc
     */

    public function getCredentials(Request $request)
    {
        if ($apiKey = $request->headers->get('x-api-key')) {
            // check for API key parameter
            return [
                'apiKey' => $apiKey
            ];
        } else {
            // check for existing session user
            if (null !== $pimcoreUser = Authentication::authenticateSession()) {
                return [
                    'user' => $pimcoreUser
                ];
            }
        } 

        throw $this->createAccessDeniedException();
    }
    /**
     * @param \Throwable|null $previous
     * @return AccessDeniedHttpException
     */
    private function createAccessDeniedException(\Throwable $previous = null)
    {
        return new AccessDeniedHttpException('API request needs either a valid API key or a valid session.', $previous);
    }
}