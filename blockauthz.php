<?php
/**
 * Authentication block: module for PrestaShop 1.5
 *
 * @author      zapalm <zapalm@ya.ru>
 * @copyright   (c) 2013-2016, zapalm
 * @link        http://prestashop.modulez.ru/en/home/38-authentication-block.html The module's homepage
 * @license     http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)
 */

if (!defined('_PS_VERSION_'))
	exit;

class BlockAuthz extends Module
{
	/**
	 * @inheritdoc
	 */
	public function __construct()
	{
		$this->name = 'blockauthz';
		$this->tab = 'front_office_features';
		$this->version = '1.0.0';
		$this->author = 'zapalm';
		$this->need_instance = 0;
		//$this->ps_versions_compliancy = array('min' => '1.5.0.0');

		parent::__construct();

		$this->displayName = $this->l('Authentication block');
		$this->description = $this->l('Allow to display the authentication block.');
	}

	/**
	 * @inheritdoc
	 */
	public function install()
	{
		return parent::install()
			&& $this->registerHook('displayHeader')
			&& $this->registerHook('displayRightColumn')
			&& $this->registerHook('displayTop')
		;
	}

	/**
	 * @inheritdoc
	 */
	public function uninstall()
	{
		return parent::uninstall();
	}

	/**
	 * Hook common template data.
	 *
	 * @return bool
	 */
	private function _hookCommon() {
		if ($this->context->customer->isLogged()) {
			return false;
		}

		if (!$this->isCached('blockauthz.tpl', $this->getCacheId())) {
			$this->smarty->assign(array(
				'top'   => false,
				'block' => false,
			));
		}

		return true;
	}

	/**
	 * Hook DisplayHeader
	 */
	public function hookDisplayHeader()
	{
		$this->context->controller->addCSS(($this->_path).'blockauthz.css', 'all');
	}

	/**
	 * Hook DisplayTop
	 *
	 * @param array $params
	 *
	 * @return string
	 */
	public function hookDisplayTop($params)
	{
		if (!$this->_hookCommon()) {
			return '';
		}

		$this->smarty->assign(array(
			'top' => true,
		));

		return $this->display(__FILE__, 'blockauthz.tpl', $this->getCacheId());
	}

	/**
	 * Hook DisplayRightColumn
	 *
	 * @param array $params
	 *
	 * @return string
	 */
	public function hookDisplayRightColumn($params)
	{
		if (!$this->_hookCommon()) {
			return '';
		}

		$this->smarty->assign(array(
			'block' => true,
		));

		return $this->display(__FILE__, 'blockauthz.tpl', $this->getCacheId());
	}

	/**
	 * Hook DisplayLeftColumn
	 *
	 * @param array $params
	 *
	 * @return string
	 */
	public function hookDisplayLeftColumn($params)
	{
		return $this->hookDisplayRightColumn($params);
	}
}