-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\138_2021.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  for l_1_5 = 1, #l_1_0, 2 do
    local l_1_6 = #l_1_1 + 1
    l_1_1[l_1_6] = tonumber(l_1_0:sub(l_1_5, l_1_5 + 1), 16)
  end
  return l_1_1
end

local l_0_2 = function(l_2_0, l_2_1, l_2_2, l_2_3)
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_4 = l_0_0(l_2_1)
  local l_2_5 = {}
  local l_2_6 = #l_2_4
  for l_2_10 = 1, #l_2_0 do
    l_2_5[l_2_10] = (mp.bitxor)((string.byte)(l_2_0, l_2_10), l_2_4[(l_2_10 + l_2_2 - 1) % l_2_6 + 1])
    if l_2_3 < l_2_10 then
      break
    end
  end
  do
    return l_2_5
  end
end

local l_0_3 = function(l_3_0)
  -- function num : 0_2
  local l_3_1 = tonumber
  local l_3_4 = (l_3_0:reverse()):gsub
  do
    local l_3_5 = l_3_0:reverse()
    l_3_4 = l_3_4(l_3_5, ".", function(l_4_0)
    -- function num : 0_2_0
    local l_4_1 = string.format
    local l_4_2 = "%02x"
    do
      local l_4_3, l_4_4 = (string.byte)(l_4_0), .end
      do return l_4_1(l_4_2, l_4_3, l_4_4) end
      -- DECOMPILER ERROR at PC9: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
    local l_3_2 = nil
    l_3_5 = 16
    local l_3_3 = nil
    do return l_3_1(l_3_4, l_3_5) end
    -- DECOMPILER ERROR at PC10: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_4 = function(l_4_0)
  -- function num : 0_3
  local l_4_1 = ""
  for l_4_5 = 1, #l_4_0 do
    local l_4_6 = l_4_0[l_4_5]
    if l_4_6 < 36 or l_4_6 > 126 then
      l_4_6 = "|"
    else
      l_4_6 = (string.char)(l_4_6)
    end
    l_4_1 = l_4_1 .. l_4_6
  end
  return l_4_1
end

local l_0_5 = 627024
local l_0_6 = 2000
if ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA == 0 then
  return mp.CLEAN
end
local l_0_7 = false
while 1 do
  local l_0_9 = nil
  local l_0_8 = (pe.foffset_rva)(((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA) + 20
  ;
  (mp.readprotection)(false)
  local l_0_10 = false
  if (mp.bitand)(l_0_3((mp.readfile)(l_0_8, 4)), 4278190080) ~= 2147483648 then
    l_0_10 = true
  end
  l_0_8 = l_0_9 + (mp.bitand)(l_0_3((mp.readfile)(l_0_8, 4)), 16777215)
  if l_0_10 then
    local l_0_11 = nil
    local l_0_12 = nil
    local l_0_13 = nil
    local l_0_14 = nil
    if (l_0_4(l_0_2((mp.readfile)((pe.foffset_rva)(l_0_3((mp.readfile)(l_0_8, 4))) + l_0_5, l_0_6), "2aeb18b4d32e076a133132de579218a4c9e3bbdc4d18370cf7664754169ed82d7c6e839a6c28e2e7600b87e34f5e97a68272406985a916a34fec0e495f93821f756bb7bfde512d2c926786cb4740bec4c5022f84f093060457717104e1a80b94d2be43d174f41f7cb416ba87c45ff45080367cfa04dc53bfdc34717ec13f9cc4", l_0_5, l_0_6))):find("GetUserGeoID", 1, true) then
      (mp.set_mpattribute)("HSTR:IntentToGetUserGeoID")
      l_0_7 = true
    end
    if (l_0_4(l_0_2((mp.readfile)((pe.foffset_rva)(l_0_3((mp.readfile)(l_0_8, 4))) + l_0_5, l_0_6), "2aeb18b4d32e076a133132de579218a4c9e3bbdc4d18370cf7664754169ed82d7c6e839a6c28e2e7600b87e34f5e97a68272406985a916a34fec0e495f93821f756bb7bfde512d2c926786cb4740bec4c5022f84f093060457717104e1a80b94d2be43d174f41f7cb416ba87c45ff45080367cfa04dc53bfdc34717ec13f9cc4", l_0_5, l_0_6))):find("GetGeoInfoW", 1, true) then
      (mp.set_mpattribute)("HSTR:IntentToGetGeoInfoW")
      if l_0_7 then
        l_0_7 = true
        do break end
        -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_STMT

        -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_STMT

        -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
do
  l_0_10 = mp
  l_0_10 = l_0_10.readprotection
  l_0_11 = true
  l_0_10(l_0_11)
  if l_0_7 then
    l_0_10 = mp
    l_0_10 = l_0_10.INFECTED
    return l_0_10
  end
  l_0_10 = mp
  l_0_10 = l_0_10.CLEAN
  do return l_0_10 end
  -- DECOMPILER ERROR at PC123: freeLocal<0 in 'ReleaseLocals'

end

