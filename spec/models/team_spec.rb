require 'rails_helper'

describe Team do
  it { should have_one(:coordinator) }
  it { should have_many(:players).through(:coordinator) }
end