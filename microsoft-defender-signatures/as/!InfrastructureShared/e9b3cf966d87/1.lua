-- Threat: !InfrastructureShared
-- Name: e9b3cf966d87
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = string.match(string.lower(this_sigattrlog[1].utf8p1), "services\\(.*)\\\\group")
  if not l_0_1 or not l_0_0 then
    return mp.CLEAN
  end
  local l_0_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\ServiceGroupOrder"
  local l_0_3 = sysio.RegOpenKey(l_0_2)
  if l_0_3 then
    local l_0_4 = sysio.GetRegValueAsMultiString(l_0_3, "List")
    if not l_0_4 or not next(l_0_4) then
      return mp.CLEAN
    end
    local l_0_5 = ""
    for l_0_6, l_0_7 in ipairs(l_0_4) do
      l_0_5 = l_0_5 .. l_0_7 .. "|"
    end
    local l_0_8 = l_0_0 .. "(.-)|Filter|"
    if string.find(l_0_5, l_0_8, 1, false) then
      local l_0_9 = SetPersistContextNoPath("NewServiceRegistered_LoadsBeforeEdr_" .. l_0_1, "true")
      local l_0_10 = SetPersistContextNoPath("NewServiceRegistered_LoadsBeforeAV_" .. l_0_1, "true")
      if not l_0_9 or not l_0_10 then
        bm.add_related_string("Error setting PersistContext", "EDR:" .. tostring(l_0_9) .. ";AV:" .. tostring(l_0_10), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    else
      local l_0_11 = SetPersistContextNoPath("NewServiceRegistered_LoadsBeforeAV_" .. l_0_1, "true")
      if not l_0_11 then
        bm.add_related_string("Error setting PersistContext", "AV:false", bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
  if QueryPersistContextNoPath("SymLinkCreatedForMDE_EDR", "true") then
    bm.add_related_string("SymlinkForEDRExists", "True", bm.RelatedStringBMReport)
    return mp.INFECTED
  end
  if QueryPersistContextNoPath("SymLinkCreatedForMDE_AV", "true") then
    bm.add_related_string("SymlinkForAVExists", "True", bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
