-- Threat: !InfrastructureShared
-- Name: !#SLF:SystemDropUnsigned
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if peattributes.isdamaged then
  return mp.CLEAN
end
if not peattributes.no_security then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
  if l_0_0 == 4 then
    if mp.IsTrustedFile(false) == true then
      return mp.CLEAN
    end
    local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
    if l_0_1 ~= nil then
      local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
      if l_0_2 == nil then
        return mp.CLEAN
      end
      local l_0_3 = {
        [":\\windows\\softwaredistribution"] = 1,
        [":\\windows\\assembly\\nativeimage"] = 1,
        [":\\program files\\cisco\\amp\\tmp\\"] = 1,
        [":\\windows\\carbonblack\\store\\tm"] = 1,
        [":\\program files (x86)\\trend mi"] = 1,
        [":\\program files\\trend\\sprotect"] = 1,
        [":\\$windows.~bt\\newos\\windows\\w"] = 1,
        [":\\windows\\winsxs\\temp\\inflight"] = 1,
        [":\\build_drop\\3ebuilddrop\\build"] = 1,
        [":\\windows\\csc\\v2.0.6\\namespace"] = 1,
        [":\\program files (x86)\\bmw\\ispi"] = 1,
        [":\\program files\\sourcefire\\fir"] = 1,
        [":\\programdata\\origin\\selfupdat"] = 1,
        [":\\program files\\microsoft dyna"] = 1,
        [":\\program files\\matlab\\r2019a\\"] = 1
      }
      if 30 < #l_0_2 then
        local l_0_4 = string.sub(l_0_2, 2, 31):lower()
        if l_0_3[l_0_4] or string.find(l_0_4, "\\$windows.~bt\\", 1, true) then
          return mp.CLEAN
        end
      end
      if not MpCommon.QueryPersistContext(l_0_1, "SystemDrop") then
        MpCommon.AppendPersistContext(l_0_1, "SystemDrop", 600)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
