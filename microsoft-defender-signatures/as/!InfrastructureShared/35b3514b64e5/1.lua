-- Threat: !InfrastructureShared
-- Name: 35b3514b64e5
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and MpCommon.GetPersistContextCountNoPath("OfficeWmiProc") > 0 then
  local l_0_1 = MpCommon.GetPersistContextNoPath("OfficeWmiProc")
  if string.find(l_0_0, "wmiprvse.exe", 1, true) then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
