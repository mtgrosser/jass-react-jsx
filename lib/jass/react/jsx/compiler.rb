require 'digest/md5'

class Jass::React::JSX::Compiler < Nodo::Core
  require babelCore: '@babel/core', pluginTransformReactJSX: '@babel/plugin-transform-react-jsx'

  class_function def compile(source, filename)
    filename = File.basename(filename)
    compile_component(source, filename)
  end
  
  function :compile_component, <<~'JS'
    (source, filename) => {
      let code = '';
      nodo.debug(`Compiling component ${filename}`);
      
      const result = babelCore.transformSync(source,
        { plugins: [
            ["@babel/plugin-transform-react-jsx", { "runtime": "automatic" } ]
          ]
        }
      );
      
      return { code: result.code, map: result.map };
    }
  JS

end
