require 'rails_helper'

describe Player do
  it { should belong_to(:coordinator)}
  it { should have_one(:team).through(:coordinator)}
end