{**
 * Authentication block: module for PrestaShop 1.5
 *
 * @author      zapalm <zapalm@ya.ru>
 * @copyright   (c) 2013-2016, zapalm
 * @link        http://prestashop.modulez.ru/en/home/38-authentication-block.html The module's homepage
 * @license     http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)
*}

<!-- MODULE blockauthz -->
{if $block}
	<div id="blockauthz_block_sidebar" class="block">
		<h4 class="title_block">{l s='Log In' mod='blockauthz'}</h4>
		<div class="block_content clearfix">
			<form action="{$link->getPageLink('authentication', true)}" method="post" id="login_form" class="std">
				<p>
					<label for="email">{l s='Email address' mod='blockauthz'}</label>
					<span><input type="text" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="account_input" /></span>
				</p>
				<p>
					<label for="passwd">{l s='Password' mod='blockauthz'}</label>
					<span><input type="password" id="passwd" name="passwd" value="{if isset($smarty.post.passwd)}{$smarty.post.passwd|stripslashes}{/if}" class="account_input" /></span>
				</p>
				<p class="submit clearfix">
					<input type="submit" id="SubmitLogin" name="SubmitLogin" class="button " value="{l s='Log In' mod='blockauthz'}" />
				</p>
				<p class="links">
					<a class="signin" href="{$link->getPageLink('authentication', true)}&SubmitCreate&email_create=your@email.com">{l s='Sign In' mod='blockauthz'}</a>
					<a class="login" href="{$link->getPageLink('password')}">{l s='Recover password' mod='blockauthz'}</a>
				</p>
			</form>
		</div>
	</div>
{elseif $top}
	<div id="blockauthz_block_top" class="block">
		<h4 class="title_block">{l s='Log In' mod='blockauthz'}</h4>
		<div class="block_content clearfix">
			<form action="{$link->getPageLink('authentication', true)}" method="post" id="login_form" class="std">
				<p>
					<label for="email">{l s='Email address' mod='blockauthz'}</label>
					<span><input type="text" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="account_input" /></span>
				</p>
				<p>
					<label for="passwd">{l s='Password' mod='blockauthz'}</label>
					<span><input type="password" id="passwd" name="passwd" value="{if isset($smarty.post.passwd)}{$smarty.post.passwd|stripslashes}{/if}" class="account_input" /></span>
				</p>
				<p class="submit clearfix">
					<input type="submit" id="SubmitLogin" name="SubmitLogin" class="button " value="{l s='Log In' mod='blockauthz'}" />
				</p>
				<p class="links">
					<a class="signin" href="{$link->getPageLink('authentication', true)}&SubmitCreate&email_create=your@email.com">{l s='Sign In' mod='blockauthz'}</a>
					<a class="login" href="{$link->getPageLink('password')}">{l s='Recover password' mod='blockauthz'}</a>
				</p>
			</form>
		</div>
	</div>
{/if}
<!-- /MODULE blockauthz -->
