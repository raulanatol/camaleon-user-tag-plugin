User.class_eval do
  scope :any_tags, -> (tags) { where('tags && ARRAY[?]', tags) }
  scope :all_tags, -> (tags) { where('tags @> ARRAY[?]', tags) }
end