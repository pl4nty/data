-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c76b357dc0fb8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
for l_0_6 = 1, l_0_0 do
  if (sigattr_tail[l_0_6]).attribute == 16384 and (sigattr_tail[l_0_6]).utf8p1 and ((sigattr_tail[l_0_6]).utf8p1):byte(1) ~= 37 then
    local l_0_7 = (sigattr_tail[l_0_6]).utf8p1
    if l_0_1[l_0_7] == nil then
      l_0_1[l_0_7] = l_0_6
    end
  end
end
for l_0_11,l_0_12 in pairs(l_0_1) do
  local l_0_13 = false
  for l_0_17 = 1, l_0_0 do
    if (sigattr_tail[l_0_17]).attribute == 16389 and (sigattr_tail[l_0_17]).utf8p1 == l_0_11 then
      l_0_13 = true
      break
    end
  end
  do
    do
      if l_0_13 == false then
        l_0_2[l_0_11] = 1
      end
      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
for l_0_21,l_0_22 in pairs(l_0_2) do
  (mp.TriggerScanResource)("file", l_0_21)
end
return mp.CLEAN

