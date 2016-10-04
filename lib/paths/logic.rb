module Paths
  module Logic
    STORAGE_FOLDER = "#{File.dirname(__FILE__)}/../../storage".freeze
    SCRIPT_FOLDER = 'logic'.freeze
    SOURCE_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/source".freeze
    OUTPUT_PATH = "#{STORAGE_FOLDER}/#{SCRIPT_FOLDER}/output".freeze
    IMAGE_PATH = '%{folder_path}/%{image_name}'.freeze

    PATHS = {
        image_a: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image_a.jpg' },
        image_b: IMAGE_PATH % { folder_path: SOURCE_PATH, image_name: 'image_b.jpg' },
        not_a: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'not_a.png' },
        not_b: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'not_b.png' },
        and: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'and.png' },
        or: IMAGE_PATH % { folder_path: OUTPUT_PATH, image_name: 'or.png' }
    }.freeze
  end
end