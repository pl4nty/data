-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Linux/SuspExecutionOnZimbra.A
-- Type: 35
-- Includes: HvaLookupHelpers
-- MpAttributes: BM_ELF_EXEC_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {
  "/var/tmp/mkinitramfs",
  "initramfs",
  "/var/tmp/dracut"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) then
    return mp.CLEAN
  end
end
local l_0_4 = {
  "/var/tmp/",
  "/tmp/",
  "/dev/shm/"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if l_0_0:sub(1, #l_0_6) == l_0_6 and IsDeviceHVA() then
    local l_0_7 = ExtractDeviceProperties()
    if l_0_7.DeviceRoles and l_0_7.DeviceRoles.ZimbraMailServer ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
