module ApplicationHelper
  def attached_present(resource)
    resource.attached? && resource.attachment.blob.present? && resource.attachment.blob.persisted?
  end

  def duration_video(video)
    video.metadata[:duration]
  end
end
