<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Captcha implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $recaptcha_url = 'https://www.google.com/recaptcha/api/siteverify';
        $recaptcha_secret = '6LdpbaQZAAAAALxeec6qfQ96wz1PBenioHG29xYL';
        $recaptcha_response = $value;
        $recaptcha = file_get_contents( $recaptcha_url . '?secret=' . $recaptcha_secret . '&response=' . $recaptcha_response);
        $recaptcha = json_decode($recaptcha);
        // Take action based on the score returned:
        if ($recaptcha->success === true) {
            return true;
        } else {
            return false;
            redirect('register')->with('error', 'Captcha error!');
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {        
        return "Validation Captcha Error.";
    }
}
