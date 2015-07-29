FH_CONFIG = YAML.load_file("#{Rails.root}/config/fanhattan.yml")[Rails.env].with_indifferent_access
