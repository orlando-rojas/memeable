class UrlImgValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    end_url_img = value.match(/\.(jpg|png|gif)\z/)
    unless is_url(value) && end_url_img
      record.errors[attribute] <<  "is not a valid url"
    end
  end

  private

  def is_url(value)
    begin
      uri = URI.parse(value)
      uri.is_a?(URI::HTTP)
    rescue URI::InvalidURIError
      return false
    end
    true
  end
end