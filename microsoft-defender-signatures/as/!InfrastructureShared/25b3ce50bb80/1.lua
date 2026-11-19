-- Threat: !InfrastructureShared
-- Name: 25b3ce50bb80
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
if l_0_1 then
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if string.find(string.lower(l_0_3), "hkcu@s-1-5-21-", 1, true) then
      local l_0_4 = sysio.RegOpenKey(l_0_3)
      if l_0_4 then
        local l_0_5 = sysio.RegEnumValues(l_0_4)
        for l_0_6, l_0_7 in pairs(l_0_5) do
          local l_0_8 = string.lower(sysio.GetRegValueAsString(l_0_4, l_0_7))
          if l_0_8 and string.find(l_0_8, l_0_0, 1, true) then
            bm.add_related_string("AutorunEntry", l_0_7 .. ";" .. l_0_8, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
