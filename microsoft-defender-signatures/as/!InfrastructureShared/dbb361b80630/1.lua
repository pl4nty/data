-- Threat: !InfrastructureShared
-- Name: dbb361b80630
-- Type: 21

local l_0_0 = {
  ["explorer.exe"] = "",
  ["hh.exe"] = "",
  ["isuninst.exe"] = "",
  ["notepad.exe"] = "",
  ["regedit.exe"] = "",
  ["slrundll.exe"] = "",
  ["taskman.exe"] = "",
  ["twunk_16.exe"] = "",
  ["twunk_32.exe"] = "",
  ["winhelp.exe"] = "",
  ["winhlp32.exe"] = "",
  ["bfsvc.exe"] = "",
  ["fveupdate.exe"] = "",
  ["helppane.exe"] = "",
  ["write.exe"] = "",
  ["splwow64.exe"] = ""
}
local l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched then
  l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_4 = string.lower(this_sigattrlog[2].utf8p2)
  l_0_3 = string.lower(this_sigattrlog[3].utf8p1)
  if l_0_1 ~= nil and l_0_4 ~= nil and l_0_3 ~= nil and l_0_1 == l_0_3 then
    l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
    if l_0_0[l_0_2] and string.find(l_0_4, l_0_2) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
