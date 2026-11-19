-- Threat: !InfrastructureShared
-- Name: f7b3a6103b5d
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  local l_0_0 = this_sigattrlog[4].utf8p2
  bm.add_related_string("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  if string.find(l_0_0, "BadUrlRep", 1, true) then
    local l_0_1 = bm.get_imagepath() or ""
    local l_0_2 = {
      "httpd",
      "w3wp",
      "sqlservr",
      "tomcat"
    }
    if not contains(l_0_1, l_0_2) then
      local l_0_3, l_0_4 = pcall(reportBmInfo)
      if not l_0_3 and l_0_4 then
        bm.add_related_string("bmInfoFailReason", tostring(l_0_4), bm.RelatedStringBMReport)
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
