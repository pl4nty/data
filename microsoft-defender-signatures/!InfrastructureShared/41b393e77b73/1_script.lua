-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b393e77b73\1_luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
local l_0_2 = false
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[1]).ppid
  l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p2)
end
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[2]).ppid
  l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = GetRealPidForScenario(l_0_0)
if l_0_1:find("powershell%.exe$") or l_0_1:find("cmd%.exe$") then
  local l_0_3, l_0_4 = (bm.get_process_relationships)()
  for l_0_8,l_0_9 in ipairs(l_0_3) do
    if IsPidObservedGlobal(l_0_9.ppid) then
      local l_0_10 = GetTacticsTableForPid(l_0_9.ppid)
      local l_0_11 = GetTechniquesTableForPid(l_0_9.ppid)
      if l_0_10 ~= nil then
        for l_0_15,l_0_16 in pairs(l_0_10) do
          AddTacticForPid(l_0_0, l_0_15)
          l_0_2 = true
        end
      end
      do
        if l_0_11 ~= nil then
          for l_0_20,l_0_21 in pairs(l_0_11) do
            AddTechniqueForPid(l_0_0, l_0_20)
            l_0_2 = true
          end
        end
        do
          do
            TrackPidAndTechniqueBM(l_0_9.ppid, "tt_to_child", "tt_to_child")
            -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end
if l_0_2 then
  l_0_3 = TrackPidAndTechniqueBM
  l_0_4 = l_0_0
  l_0_3(l_0_4, "has_inherited_tt", "has_inherited_tt")
  l_0_3 = mp
  l_0_3 = l_0_3.INFECTED
  return l_0_3
end
l_0_3 = mp
l_0_3 = l_0_3.CLEAN
return l_0_3

