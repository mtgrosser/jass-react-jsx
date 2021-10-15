require_relative 'test_helper'

class JassReactJSXTest < Minitest::Test
  
  def setup
    Nodo.logger.clear!
  end

  def test_compile_component
    result = compile_component('Clock.jsx')
    assert_match /children: "Hello, world!"/, result['code']
  end
  
  def test_compilation_error
    assert_raises Nodo::JavaScriptError do
      compile_component('Broken.jsx')
    end
    assert_equal 1, Nodo.logger.errors.size
    assert_match /Nodo::JavaScriptError/, Nodo.logger.errors.first
  end
  
  private
  
  def compile_component(name)
    Jass::React::JSX::Compiler.compile(load_component(name), name)
  end
  
  def load_component(name)
    Pathname.new(__FILE__).dirname.join(name).read
  end
end
