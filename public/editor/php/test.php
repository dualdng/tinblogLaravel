<?php
echo dirname(__FILE__).'/attached<br />';
echo dirname(__FILE__).'/attached<br />';
echo dirname(dirname(__FILE__)).'/attached<br/ >';
echo dirname(dirname(dirname(dirname(__FILE__)))).'/attached<br/ >';
$path=dirname(dirname(dirname(dirname(__FILE__)))).'/attached';
echo realpath($path);
?>
