# -*- encoding: utf-8 -*-
#
# Author:: Omer Katz (<omer@zimperium.com>)
#
# Copyright (C) 2014, Omer Katz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'busser/runner_plugin'

# A Busser runner plugin for Nose2.
#
# @author Omer Katz <omer.drow@gmail.com>
#
class Busser::RunnerPlugin::Nose2 < Busser::RunnerPlugin::Base
  postinstall do
    run!("pip install nose2")
  end

  def test
    run!("nose2 --start-dir #{suite_path('nose2').to_s}/tests")
  end
end
