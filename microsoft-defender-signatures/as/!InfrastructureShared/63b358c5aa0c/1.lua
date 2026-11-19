-- Threat: !InfrastructureShared
-- Name: 63b358c5aa0c
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = string.lower(l_0_3.image_path)
    local l_0_5 = mp.bitand(l_0_3.reason_ex, 1)
    if l_0_5 == 1 and (string.find(l_0_4, "\\program files (x86)\\", 1, true) or string.find(l_0_4, "\\program files\\", 1, true) or string.find(l_0_4, "\\winreseau.exe", 1, true)) then
      return mp.CLEAN
    end
  end
end
local l_0_6 = string.lower(bm.get_imagepath())
if string.find(l_0_6, "\\program files\\", 1, true) or string.find(l_0_6, "\\program files (x86)\\", 1, true) or string.find(l_0_6, "\\putty.exe", 1, true) or string.find(l_0_6, "\\taputty.exe", 1, true) or string.find(l_0_6, "\\njlink.exe", 1, true) or string.find(l_0_6, "\\bmc", 1, true) or string.find(l_0_6, "\\ebarsoftware", 1, true) or string.find(l_0_6, "\\aethos", 1, true) or string.find(l_0_6, "\\aquasuite_rap", 1, true) or string.find(l_0_6, "\\runremote", 1, true) or string.find(l_0_6, "\\util\\bin\\ssh", 1, true) or string.find(l_0_6, "\\tightvnc", 1, true) then
  return mp.CLEAN
end
local l_0_7 = ""
if this_sigattrlog[1].matched then
  l_0_7 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_7 = this_sigattrlog[2].utf8p2
end
if l_0_7 ~= "" and string.find(l_0_7, " -pw ", 1, true) and string.find(l_0_7, " -P ", 1, true) and string.find(l_0_7, " -R ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
