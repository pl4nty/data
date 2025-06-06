-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\221b30e2ae6fd\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
local l_0_1 = false
if not l_0_0 then
  return mp.CLEAN
end
do
  if (this_sigattrlog[1]).matched then
    local l_0_2 = (this_sigattrlog[1]).utf8p2
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_3 = (string.lower)(l_0_2)
  if #l_0_3 > 450 then
    return mp.CLEAN
  end
  if #l_0_3 < 50 then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = (bm.get_process_relationships)()
  for l_0_9,l_0_10 in ipairs(l_0_4) do
    if l_0_10.image_path ~= nil and (mp.bitand)(l_0_10.reason_ex, 1) == 1 and (string.lower)((string.sub)(l_0_10.image_path, -13)) == "\\explorer.exe" then
      l_0_1 = true
      break
    end
  end
  do
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_11 = contains
    local l_0_12 = l_0_3
    do
      local l_0_13 = {}
      -- DECOMPILER ERROR at PC109: No list found for R7 , SetList fails

      -- DECOMPILER ERROR at PC113: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC114: Overwrote pending register: R5 in 'AssignReg'

      if l_0_11 then
        return l_0_11
      end
      -- DECOMPILER ERROR at PC116: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC117: Overwrote pending register: R5 in 'AssignReg'

      do return l_0_11 end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

