class Pdftk < BaseCustom
  S3_PREFIX='http://s3.amazonaws.com/heroku_binaries'
  NAME_SOURCES={ pdftk: "#{S3_PREFIX}/pdftk.tar.gz", poppler:  "#{S3_PREFIX}/heroku-poppler.tgz"}
  def path
    "#{build_path}/vendor"
  end
  def compile
    NAME_SOURCES.each do |name,source_url|
      write_stdout "copying #{name}"
      #download the source and extract
      %x{ mkdir -p #{path} && curl --silent #{source_url} -o - | tar -xz -C #{path} -f - }
      write_stdout "complete extracting #{name}"
    end
  end
  def cleanup!
    
  end
  def prepare
  end
  
end
