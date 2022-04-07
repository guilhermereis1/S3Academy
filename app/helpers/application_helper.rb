module ApplicationHelper
  def attached_present(resource)
    resource.attached? && resource.attachment.blob.present? && resource.attachment.blob.persisted?
  end

  def duration_video(video)
    video.metadata[:duration]
  end

  def identify_content_type(resource)
    font_size = "22px"
    
    case resource.content_type
    when "application/pdf"
      { extension: ".pdf", icon: ("<i class='bi bi-file-earmark-pdf-fill' style='font-size: #{font_size}'></i>").html_safe }
    when "image/svg+xml"
      { extension: ".svg", icon: ("<i class='bi bi-filetype-svg' style='font-size: #{font_size}'></i>").html_safe }
    when "image/png"
      { extension: ".png", icon: ("<i class='bi bi-filetype-png' style='font-size: #{font_size}'></i>").html_safe }
    when "image/jpeg"
      { extension: ".jpg", icon: ("<i class='bi bi-filetype-jpg' style='font-size: #{font_size}'></i>").html_safe }
    when "image/gif"
      { extension: ".gif", icon: ("<i class='bi bi-filetype-gif' style='font-size: #{font_size}'></i>").html_safe }
    when "images/x-xbitmap"
      { extension: ".xbm", icon: ("<i class='bi bi-filetype-xbm' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.ms-excel"
      { extension: ".xls", icon: ("<i class='bi bi-filetype-xls' style='font-size: #{font_size}'></i>").html_safe }
    when "application/msword"
      { extension: ".doc", icon: ("<i class='bi bi-filetype-doc' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      { extension: ".docx", icon: ("<i class='bi bi-filetype-docx' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      { extension: ".xlsx", icon: ("<i class='bi bi-filetype-xlsx' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      { extension: ".pptx", icon: ("<i class='bi bi-filetype-pptx' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.apple.keynote"
      { extension: ".key", icon: ("<i class='bi bi-filetype-key' style='font-size: #{font_size}'></i>").html_safe }
    when "text/plain"
      { extension: ".txt", icon: ("<i class='bi bi-filetype-txt' style='font-size: #{font_size}'></i>").html_safe }
    when "application/zip"
      { extension: ".zip", icon: ("<i class='bi bi-file-zip' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-rar-compressed"
      { extension: ".rar", icon: ("<i class='bi bi-file-zip-fill' style='font-size: #{font_size}'></i>").html_safe }
    when 'application/x-gzip'
      { extension: ".gz", icon: ("<i class='bi bi-file-zip-fill' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-tar"
      { extension: ".tar", icon: ("<i class='bi bi-file-zip-fill' style='font-size: #{font_size}'></i>").html_safe }
    when "application/ruby"
      { extension: ".rb", icon: ("<i class='bi bi-filetype-rb' style='font-size: #{font_size}'></i>").html_safe }
    when "text/javascript"
      { extension: ".js", icon: ("<i class='bi bi-filetype-js' style='font-size: #{font_size}'></i>").html_safe }
    when "application/json"
      { extension: ".json", icon: ("<i class='bi bi-filetype-json' style='font-size: #{font_size}'></i>").html_safe }
    when "text/css"
      { extension: ".css", icon: ("<i class='bi bi-filetype-css' style='font-size: #{font_size}'></i>").html_safe }
    when "text/html"
      { extension: ".html", icon: ("<i class='bi bi-filetype-html' style='font-size: #{font_size}'></i>").html_safe }
    when "text/xml"
      { extension: ".xml", icon: ("<i class='bi bi-filetype-xml' style='font-size: #{font_size}'></i>").html_safe }
    when "text/yaml"
      { extension: ".yml", icon: ("<i class='bi bi-filetype-yml' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-yaml"
      { extension: ".yaml", icon: ("<i class='bi bi-filetype-yaml' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-gitignore"
      { extension: ".gitignore", icon: ("<i class='bi bi-filetype-gitignore' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-sql"
      { extension: ".sql", icon: ("<i class='bi bi-filetype-sql' style='font-size: #{font_size}'></i>").html_safe }
    when "application/postscript"
      { extension: ".ai", icon: ("<i class='bi bi-filetype-ai' style='font-size: #{font_size}'></i>").html_safe }
    when "application/postscript"
      { extension: ".eps", icon: ("<i class='bi bi-filetype-eps' style='font-size: #{font_size}'></i>").html_safe }
    when "image/vnd.adobe.photoshop"
      { extension: ".psd", icon: ("<i class='bi bi-filetype-psd' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-csharp"
      { extension: ".cs", icon: ("<i class='bi bi-filetype-cs' style='font-size: #{font_size}'></i>").html_safe }
    when "text/csv"
      { extension: ".csv", icon: ("<i class='bi bi-filetype-csv' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-msdownload"
      { extension: ".exe", icon: ("<i class='bi bi-filetype-exe' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-msdownload"
      { extension: ".bat", icon: ("<i class='bi bi-filetype-bat' style='font-size: #{font_size}'></i>").html_safe }
    when "image/heic"
      { extension: ".heic", icon: ("<i class='bi bi-filetype-heic' style='font-size: #{font_size}'></i>").html_safe }
    when "text/jsx"
      { extension: ".jsx", icon: ("<i class='bi bi-filetype-jsx' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-markdown"
      { extension: ".md", icon: ("<i class='bi bi-filetype-md' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-erb"
      { extension: ".erb", icon: ("<i class='bi bi-filetype-erb' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-mdx"
      { extension: ".mdx", icon: ("<i class='bi bi-filetype-mdx' style='font-size: #{font_size}'></i>").html_safe }
    when "audio/mpeg"
      { extension: ".mp3", icon: ("<i class='bi bi-filetype-mp3' style='font-size: #{font_size}'></i>").html_safe }
    when "video/mp4"
      { extension: ".mp4", icon: ("<i class='bi bi-filetype-mp4' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-font-otf"
      { extension: ".otf", icon: ("<i class='bi bi-filetype-otf' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-httpd-php"
      { extension: ".php", icon: ("<i class='bi bi-filetype-php' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-python"
      { extension: ".py", icon: ("<i class='bi bi-filetype-py' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-raw"
      { extension: ".raw", icon: ("<i class='bi bi-filetype-raw' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-sass"
      { extension: ".sass", icon: ("<i class='bi bi-filetype-sass' style='font-size: #{font_size}'></i>").html_safe }
    when "text/x-scss"
      { extension: ".scss", icon: ("<i class='bi bi-filetype-scss' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-sh"
      { extension: ".sh", icon: ("<i class='bi bi-filetype-sh' style='font-size: #{font_size}'></i>").html_safe }
    when "image/tiff"
      { extension: ".tiff", icon: ("<i class='bi bi-filetype-tiff' style='font-size: #{font_size}'></i>").html_safe }
    when "text/tsx"
      { extension: ".tsx", icon: ("<i class='bi bi-filetype-tsx' style='font-size: #{font_size}'></i>").html_safe }
    when "application/x-font-ttf"
      { extension: ".ttf", icon: ("<i class='bi bi-filetype-ttf' style='font-size: #{font_size}'></i>").html_safe }
    when "audio/wav"
      { extension: ".wav", icon: ("<i class='bi bi-filetype-wav' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.ms-excel"
      { extension: ".xls", icon: ("<i class='bi bi-filetype-xls' style='font-size: #{font_size}'></i>").html_safe }
    when "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      { extension: ".xlsx", icon: ("<i class='bi bi-filetype-xlsx' style='font-size: #{font_size}'></i>").html_safe }
    else "undefined"
      { extension: nil, icon: ("<i class='bi bi-file' style='font-size: #{font_size}'></i>").html_safe }
    end
  end
end