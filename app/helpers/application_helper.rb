module ApplicationHelper
  def attached_present(resource)
    resource.attached? && resource.attachment.blob.present? && resource.attachment.blob.persisted?
  end
end
