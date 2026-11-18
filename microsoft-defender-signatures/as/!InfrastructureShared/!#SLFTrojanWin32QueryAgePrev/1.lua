-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/QueryAgePrev
-- Type: 13
-- Includes: AgePrevalence
-- MpAttributes: RPF:TopLevelFile

local l_0_0
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONOPEN and l_0_1 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if l_0_1 == mp.SCANREASON_UNKNOWN then
    if mp.GetResmgrBasePlugin() == "file" then
      l_0_0 = mp.getfilename()
      if not sysio.IsFileExists(l_0_0) then
        return mp.CLEAN
      end
    else
      return mp.CLEAN
    end
  else
    return mp.CLEAN
  end
end
if l_0_0 == nil then
  l_0_0 = mp.getfilename()
end
if mp.get_mpattribute("agePrevQueried") then
  if not MpCommon.QueryPersistContext(l_0_0, "agePrevQueried") then
    MpCommon.AppendPersistContext(l_0_0, "agePrevQueried", 0)
  end
  return mp.CLEAN
elseif MpCommon.QueryPersistContext(l_0_0, "agePrevQueried") then
  if not mp.get_mpattribute("agePrevQueried") then
    mp.set_mpattribute("agePrevQueried")
  end
  return mp.CLEAN
end
if mp.get_mpattributevalue("Lua:FmsAgeInDays") ~= nil then
  if not mp.get_mpattribute("agePrevQueried") then
    mp.set_mpattribute("agePrevQueried")
  end
  if not MpCommon.QueryPersistContext(l_0_0, "agePrevQueried") then
    MpCommon.AppendPersistContext(l_0_0, "agePrevQueried", 0)
  end
  return mp.CLEAN
end
local l_0_2, l_0_3 = getAgePrev(false)
if -1 < l_0_2 and -1 < l_0_3 then
  if not mp.get_mpattribute("agePrevQueried") then
    mp.set_mpattribute("agePrevQueried")
  end
  if not MpCommon.QueryPersistContext(l_0_0, "agePrevQueried") then
    MpCommon.AppendPersistContext(l_0_0, "agePrevQueried", 0)
  end
  return mp.CLEAN
end
if mp.get_mpattribute("queryAgePrev") or MpCommon.QueryPersistContext(l_0_0, "queryAgePrev") then
  mp.set_mpattribute("agePrevQueried")
  MpCommon.AppendPersistContext(l_0_0, "agePrevQueried", 0)
  return mp.INFECTED
end
if mp.get_mpattribute("disableCachingQueryAgePrev") or MpCommon.QueryPersistContext(l_0_0, "disableCachingQueryAgePrev") then
  mp.set_mpattribute("MpDisableCaching")
  mp.set_mpattribute("agePrevQueried")
  MpCommon.AppendPersistContext(l_0_0, "agePrevQueried", 0)
  return mp.INFECTED
end
return mp.CLEAN
