require 'rails_helper'

describe Contribution do
  it { should validate_presence_of :body}
end
