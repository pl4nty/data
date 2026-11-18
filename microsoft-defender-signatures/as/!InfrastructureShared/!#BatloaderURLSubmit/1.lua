-- Threat: !InfrastructureShared
-- Name: !#BatloaderURL.Submit
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCPT:BAT/BatLoader.B1

local l_0_0 = {}
local l_0_1 = tostring(headerpage) .. tostring(footerpage)
if l_0_1 ~= nil then
  for l_0_2 in string.gmatch(l_0_1, "(https?://[A-Za-z0-9./]+)/%?servername=msi") do
    if l_0_2 ~= nil and not l_0_0[l_0_2] then
      mp.set_mpattribute("MpInternal_researchdata=batloaderuri=" .. l_0_2)
      l_0_0[l_0_2] = true
    end
  end
end
return mp.CLEAN
