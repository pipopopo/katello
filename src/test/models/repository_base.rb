#
# Copyright 2012 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

require 'minitest_helper'


module RepositoryTestBase
  def self.included(base)
    base.class_eval do
      fixtures :all
    end

    base.extend ClassMethods
  end

  module ClassMethods
    def before_suite
      services  = ['Candlepin', 'Pulp', 'ElasticSearch']
      models    = ['Repository', 'Package']
      disable_glue_layers(services, models)
    end
  end

  def setup
    @fedora_17_x86_64     = Repository.find(repositories(:fedora_17_x86_64).id)
    @fedora_17_x86_64_dev = Repository.find(repositories(:fedora_17_x86_64_dev).id)
    @fedora               = Product.find(products(:fedora).id)
    @library              = KTEnvironment.find(environments(:library).id)
    @dev                  = KTEnvironment.find(environments(:dev).id)
    @acme_corporation     = Organization.find(organizations(:acme_corporation).id)
    @unassigned_gpg_key   = GpgKey.find(gpg_keys(:unassigned_gpg_key).id)
    @fedora_filter        = Filter.find(filters(:fedora_filter).id)
    @admin                = User.find(users(:admin))
  end

end
