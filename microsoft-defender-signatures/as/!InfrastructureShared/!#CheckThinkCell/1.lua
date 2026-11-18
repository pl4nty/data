-- Threat: !InfrastructureShared
-- Name: !#CheckThinkCell
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = l_0_0.ProductName
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if l_0_1 == "think-cell component" and l_0_2 == "think-cell" then
  if mp.IsTrustedFile(false) == true then
    mp.set_mpattribute("Lua:ValidSignedThinkCellComponent")
  elseif mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
    mp.set_mpattribute("Lua:SignedThinkCellComponent")
  else
    mp.set_mpattribute("Lua:UnSignedThinkCellComponent")
  end
end
return mp.CLEAN
