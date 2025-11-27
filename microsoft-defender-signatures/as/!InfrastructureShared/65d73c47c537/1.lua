-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\65d73c47c537\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == "" or l_0_1 == nil or #l_0_1 > 800 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
if l_0_2:find("recaptcha�\142", 1, true) and l_0_2:find("verification", 1, true) then
  return mp.INFECTED
end
if l_0_2:find("robot", 1, true) or l_0_2:find("captcha", 1, true) then
  return mp.CLEAN
end
local l_0_3 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  l_1_1["ο"] = "o"
  l_1_1["Ղ"] = "o"
  l_1_1["ó"] = "o"
  l_1_1["ö"] = "o"
  l_1_1["о"] = "o"
  l_1_1["օ"] = "o"
  l_1_1["ɾ"] = "r"
  l_1_1["г"] = "r"
  l_1_1["т"] = "t"
  l_1_1["Τ"] = "T"
  l_1_1["Η"] = "H"
  l_1_1["Н"] = "H"
  l_1_1["ã"] = "a"
  l_1_1["а"] = "a"
  l_1_1["Α"] = "A"
  l_1_1["Ä"] = "A"
  l_1_1["á"] = "a"
  l_1_1["ɑ"] = "a"
  l_1_1["А"] = "A"
  l_1_1["ß"] = "b"
  l_1_1["ь"] = "b"
  l_1_1["ç"] = "c"
  l_1_1["С"] = "C"
  l_1_1["Ϲ"] = "C"
  l_1_1["Р"] = "P"
  l_1_1["Ρ"] = "P"
  l_1_1["�\178"] = "I"
  l_1_1["�\145"] = "p"
  l_1_1["�\148"] = "T"
  l_1_1["�\173"] = "t"
  l_1_1["�\155"] = "t"
  l_1_1["�\142"] = ""
  local l_1_2 = ""
  local l_1_3 = 1
  while 1 do
    while 1 do
      while 1 do
        if l_1_3 <= #l_1_0 then
          local l_1_4 = l_1_0:sub(l_1_3, l_1_3 + 2)
          if l_1_1[l_1_4] then
            l_1_2 = l_1_2 .. l_1_1[l_1_4]
            l_1_3 = l_1_3 + #l_1_4
            -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
      local l_1_5 = l_1_0:sub(l_1_3, l_1_3 + 1)
      if l_1_1[l_1_5] then
        l_1_2 = l_1_2 .. l_1_1[l_1_5]
        l_1_3 = l_1_3 + #l_1_5
        -- DECOMPILER ERROR at PC63: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC63: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    l_1_2 = l_1_2 .. l_1_0:sub(l_1_3, l_1_3)
    l_1_3 = l_1_3 + 1
  end
  do
    return l_1_2
  end
end

local l_0_4 = l_0_3(l_0_1)
l_0_4 = (string.lower)(l_0_4)
if l_0_4:find("robot", 1, true) or l_0_4:find("captcha", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

