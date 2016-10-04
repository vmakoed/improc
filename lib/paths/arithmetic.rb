module Paths
  module Arithmetic
    STORAGE_FOLDER = "#{File.dirname(__FILE__)}/../../storage".freeze
    SCRIPT_FOLDER = 'arithmetic'.freeze
    SOURCE_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/source".freeze
    OUTPUT_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/output".freeze
    IMAGE_PATH = '%{folder_path}/%{image_name}'.freeze

    PATHS = {
        image_a: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image_a.jpg' },
        image_b: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image_b.jpg' },
        addition: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'addition.png' },
        subtraction: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'subtraction.png' },
        multiplication: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'multiplication.png' }
    }.freeze
  end
end