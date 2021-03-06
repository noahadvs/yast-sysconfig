# encoding: utf-8

# Sysconfig module - testsuite
#
# get_name_from_id tests
#
# testedfiles: Sysconfig.ycp
#
# $Id$
#
module Yast
  class GetNameFromIdClient < Client
    def main
      Yast.import "Testsuite"
      Yast.import "Pkg" # override packamanager
      Yast.import "Sysconfig"

      Testsuite.Test(lambda { Sysconfig.get_name_from_id(nil) }, [{}, {}, {}], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("") }, [{}, {}, {}], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("var") }, [{}, {}, {}], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("var$file") }, [
        {},
        {},
        {}
      ], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("var$") }, [{}, {}, {}], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("$file") }, [{}, {}, {}], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("var$x$file") }, [
        {},
        {},
        {}
      ], nil)
      Testsuite.Test(lambda { Sysconfig.get_name_from_id("$$varx$file") }, [
        {},
        {},
        {}
      ], nil)

      nil
    end
  end
end

Yast::GetNameFromIdClient.new.main
