-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b30d29b848\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  ;
  (bm.add_related_string)("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  do
    if not (bm.get_imagepath)() then
      local l_0_1, l_0_2 = not (string.find)(l_0_0, "BadUrlRep", 1, true) or ""
    end
    do
      local l_0_3 = nil
      if not contains(l_0_3, {"httpd", "w3wp", "sqlservr", "tomcat"}) then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

