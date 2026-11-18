-- Threat: \xa4!Shetram.B
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if string.lower(string.sub(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME), -9)) ~= " copy.lnk" then
  return mp.CLEAN
end
local l_0_1 = {
  ["cpufix.exe"] = true,
  ["antiusb.exe"] = true,
  ["streamer.exe"] = true,
  ["radnewage.exe"] = true,
  ["cpuchecker.exe"] = true,
  ["winddowsupdater.exe"] = true
}
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
local l_0_3 = {}
local l_0_4 = 0
local l_0_5 = mp.getfilename()
for l_0_6 in string.gmatch(l_0_5, "[^\\]+") do
  l_0_4 = l_0_4 + 1
  l_0_3[l_0_4] = l_0_6
end
if 2 <= #l_0_3 and string.len(l_0_3[#l_0_3]) == string.len(l_0_3[#l_0_3 - 1]) + 9 and string.sub(l_0_3[#l_0_3], 1, string.len(l_0_3[#l_0_3 - 1])) == l_0_3[#l_0_3 - 1] then
  if l_0_1[l_0_2] == true then
    return mp.INFECTED
  else
    mp.ReportLowfi(l_0_5, 2621711671)
  end
end
return mp.CLEAN
