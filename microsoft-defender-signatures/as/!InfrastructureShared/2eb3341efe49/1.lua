-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2eb3341efe49\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil or #l_0_0 == 0 then
    return mp.CLEAN
  end
  local l_0_3 = nil
  local l_0_4 = contains
  local l_0_5 = l_0_3
  l_0_4 = l_0_4(l_0_5, {"winrar.exe", "7zip.exe", "peazip.exe", "unrar.exe", "7z.exe", "360zip.exe", "7zfm.exe", "bandizip.exe", "rar.exe", "unrar.exe", "haozip.exe", "breezip.exe", "netpowerzip.exe", "xdzipapp.exe"})
  if not l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.INFECTED
    return l_0_4
  end
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end

