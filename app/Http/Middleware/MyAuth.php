<?php namespace App\Http\Middleware;

use Closure;
use Auth;//用户认证

class MyAuth {

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
			if (Auth::check())
			{
					return $next($request);
			} else {
					return redirect('login');
			}
	}

}
