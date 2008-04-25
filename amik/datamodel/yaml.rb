# amik: Track your bandwidth cap.
#
# Copyright (C) 2008 James Bowes <jbowes@dangerouslyinc.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

require 'yaml'

module AmikYaml

    class DataPoint

        attr_accessor :used, :total, :start, :end

        def to_s
            "#{@start} - #{@end} : #{@used}/#{@total} GB"
        end

    end

    class DataModel

        attr_accessor :points
        
        def initialize
            @version = "0.0.1"
        end
    end

    def load(path)
        YAML::load(File.read(path))
    end
    module_function :load

    def save(path, model)
        outfile = File.new(path, 'w')
        outfile.puts(model.to_yaml)
    end
    module_function :save
end
