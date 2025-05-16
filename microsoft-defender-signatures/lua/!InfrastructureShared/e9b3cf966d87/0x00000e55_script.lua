-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e9b3cf966d87\0x00000e55_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = (string.match)((string.lower)((this_sigattrlog[1]).utf8p1), "services\\(.*)\\\\group")
  if not l_0_1 or not l_0_0 then
    return mp.CLEAN
  end
  local l_0_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\ServiceGroupOrder"
  local l_0_3 = (sysio.RegOpenKey)(l_0_2)
  if l_0_3 then
    local l_0_4 = (sysio.GetRegValueAsMultiString)(l_0_3, "List")
    if not l_0_4 or not next(l_0_4) then
      return mp.CLEAN
    end
    local l_0_5 = ""
    for l_0_9,l_0_10 in ipairs(l_0_4) do
      l_0_5 = l_0_5 .. l_0_10 .. "|"
    end
    local l_0_11 = l_0_0 .. "(.-)|Filter|"
    if (string.find)(l_0_5, l_0_11, 1, false) then
      local l_0_12 = SetPersistContextNoPath("NewServiceRegistered_LoadsBeforeEdr_" .. l_0_1, "true")
      local l_0_13 = SetPersistContextNoPath("NewServiceRegistered_LoadsBeforeAV_" .. l_0_1, "true")
      if not l_0_12 or not l_0_13 then
        (bm.add_related_string)("Error setting PersistContext", "EDR:" .. tostring(l_0_12) .. ";AV:" .. tostring(l_0_13), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    else
      do
        do
          do
            local l_0_14 = SetPersistContextNoPath("NewServiceRegistered_LoadsBeforeAV_" .. l_0_1, "true")
            if not l_0_14 then
              (bm.add_related_string)("Error setting PersistContext", "AV:false", bm.RelatedStringBMReport)
              return mp.INFECTED
            end
            if QueryPersistContextNoPath("SymLinkCreatedForMDE_EDR", "true") then
              (bm.add_related_string)("SymlinkForEDRExists", "True", bm.RelatedStringBMReport)
              return mp.INFECTED
            end
            if QueryPersistContextNoPath("SymLinkCreatedForMDE_AV", "true") then
              (bm.add_related_string)("SymlinkForAVExists", "True", bm.RelatedStringBMReport)
              return mp.INFECTED
            end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

