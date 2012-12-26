<?php

abstract class Rvar {
  protected $value;

  function __construct($val) {
    $this->value = $val;
  }

  abstract function exec();
}

class Rvector extends Rvar {
  function exec() {
    $out = array();
    if (is_int($this->value[0])) {
      foreach ($this->value as $val) {
        $out[] = $val;
      }
    }
    else {
      foreach ($this->value as $val) {
        $out[] = "\"$val\"";
      }
    }
    return 'c(' . implode(',', $out) . ')';
  }
}

class R {
  protected $commands = array();
  public $runfile = '/tmp/kevin.R';

  function __call($func, $args) {
    $this->commands[] = "$func(" . implode(',', $args) . ")";
    return $this;
  }

  function __set($key, $val) {
    $cmd = is_string($val) ? $val : $val->exec();
    $this->commands[] = $key . ' <- ' . $cmd;
    return $this;
  }

  function run() {
    $file = implode("\n", $this->commands) . "\n";
    if (file_put_contents($this->runfile, $file)) {
      exec('Rscript ' . $this->runfile);
    }
  }
}

$r = new R();
$r->a = "c(1,2,3,4,5,6)";
$r->b = new Rvector(array(1,2,3,4,5,6));
$r->png('filename="/tmp/kevin.png"', 'height=500', 'width=800', 'bg="black"')
->plot('a', 'b', 'col="yellow"', 'col.axis="white"', 'col.lab="white"', 'col.main="white"', 'col.sub="white"')
->run();
