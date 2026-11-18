-- Threat: !InfrastructureShared
-- Name: 2db3c7c1ef4d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[1].ppid
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if string.sub(l_0_0, 1, 1) == "%" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = IsLegacyOrgMachine()
if l_0_2 == true then
  bm.trigger_sig("LegacyOrgMachine", l_0_3, l_0_1)
end
local l_0_4 = this_sigattrlog[1].utf8p2
if versioning.GetCloudBlockLevel() >= 4 and IsLegacyOrgMachine() == false and l_0_4 ~= nil and 1 <= #l_0_4 then
  local l_0_5 = string.find(l_0_4, " ", 1, true)
  if l_0_5 ~= nil and l_0_5 ~= #l_0_4 then
    local l_0_6 = getCustomStringHash(l_0_4)
    if l_0_6 ~= nil then
      local l_0_7 = "CommandLineCustomHash:" .. l_0_6
      if MpCommon.GetPersistContextCountNoPath(l_0_7) > 0 and not MpCommon.QueryPersistContextNoPath(l_0_7, l_0_1) then
        local l_0_8 = MpCommon.GetPersistContextNoPath(l_0_7)
        local l_0_9 = false
        for l_0_10, l_0_11 in ipairs(l_0_8) do
          if 5 <= #l_0_11 then
            if string.match(l_0_11, "^[tT][0-9][0-9][0-9][0-9]") then
              local l_0_12, l_0_13 = string.match(l_0_11, "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
              TrackPidAndTechniqueBM(l_0_1, l_0_12, l_0_13, 0)
              l_0_9 = true
            elseif string.sub(l_0_11, 1, 1) == "[" then
              local l_0_14, l_0_15 = string.match(l_0_11, "^%[(.-)%]=(.+)")
              if l_0_14 ~= nil and l_0_15 ~= nil then
                bm.trigger_sig(l_0_14, l_0_15, l_0_1)
                l_0_9 = true
              end
            end
          end
        end
        if l_0_9 then
          MpCommon.AppendPersistContextNoPath(l_0_7, l_0_1, 0)
        end
      end
    end
  end
end
local l_0_16 = MpCommon.GetPersistContextCount(l_0_0)
if l_0_16 <= 0 or MpCommon.QueryPersistContextNoPath(l_0_1, "FilePersistContextToProcessRelay.A") == true then
  return mp.INFECTED
end
if 100 < l_0_16 then
  return mp.INFECTED
end
local l_0_17 = MpCommon.GetPersistContext(l_0_0)
for l_0_18, l_0_19 in ipairs(l_0_17) do
  if not MpCommon.QueryPersistContextNoPath(l_0_1, l_0_19) and 4 <= #l_0_19 and string.match(l_0_19, "^[tT][0-9][0-9][0-9][0-9]") then
    local l_0_20, l_0_21 = string.match(l_0_19, "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
    TrackPidAndTechniqueBM(l_0_1, l_0_20, l_0_21, nil, true)
    if 5 < #l_0_19 then
      local l_0_22 = string.sub(l_0_19, 0, 5)
      if not MpCommon.QueryPersistContextNoPath(l_0_1, l_0_22) then
        MpCommon.AppendPersistContextNoPath(l_0_1, l_0_22, 0)
      end
    end
    MpCommon.AppendPersistContextNoPath(l_0_1, l_0_19, 0)
  end
end
if not MpCommon.QueryPersistContextNoPath(l_0_1, "FilePersistContextToProcessRelay.A") then
  MpCommon.AppendPersistContextNoPath(l_0_1, "FilePersistContextToProcessRelay.A", 0)
end
return mp.INFECTED
