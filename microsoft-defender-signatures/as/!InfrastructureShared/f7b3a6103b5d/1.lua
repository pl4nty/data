-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f7b3a6103b5d\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
  local l_0_0 = (this_sigattrlog[4]).utf8p2
  ;
  (bm.add_related_string)("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  do
    if not (bm.get_imagepath)() then
      local l_0_1, l_0_2 = not (string.find)(l_0_0, "BadUrlRep", 1, true) or ""
    end
    local l_0_3 = nil
    do
      if not contains(l_0_3, {"httpd", "w3wp", "sqlservr", "tomcat"}) then
        local l_0_4, l_0_5 = , pcall(reportBmInfo)
        -- DECOMPILER ERROR at PC61: Overwrote pending register: R8 in 'AssignReg'

        if not l_0_5 and reportBmInfo then
          (bm.add_related_string)("bmInfoFailReason", tostring(R8_PC59), R8_PC59)
        end
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

