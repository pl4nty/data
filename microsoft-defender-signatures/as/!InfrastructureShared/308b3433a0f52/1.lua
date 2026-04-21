-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\308b3433a0f52\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC9: Overwrote pending register: R0 in 'AssignReg'

do
  if not isnull((this_sigattrlog[15]).utf8p1) then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC31: Overwrote pending register: R0 in 'AssignReg'

  if isnull((this_sigattrlog[16]).utf8p1) or not isnull((this_sigattrlog[17]).utf8p1) then
    local l_0_1, l_0_2 = (this_sigattrlog[16]).utf8p1
  else
    do
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

      local l_0_3 = nil
      if isnull((MpCommon.PathToWin32Path)(l_0_1)) then
        return mp.CLEAN
      end
      if isnull((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)(l_0_1))) then
        return mp.CLEAN
      end
      local l_0_4 = nil
      if isnull((bm.get_imagepath)()) then
        return mp.CLEAN
      end
      if isnull((MpCommon.PathToWin32Path)((bm.get_imagepath)())) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC87: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC97: Confused about usage of register: R2 in 'UnsetPending'

      if isnull((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))) or not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)())), true, false) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC108: Confused about usage of register: R2 in 'UnsetPending'

      local l_0_5 = nil
      if isnull((sysio.GetPEVersionInfo)((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)())))) or ((sysio.GetPEVersionInfo)((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)())))).CompanyName ~= "Microsoft Corporation" or ((sysio.GetPEVersionInfo)((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)())))).ProductName ~= "Microsoft Edge" then
        return mp.CLEAN
      end
      local l_0_6, l_0_7 = , l_0_4:match("^(.+)\\([^\\]+)$")
      local l_0_8 = nil
      if not l_0_7 or not l_0_5:match("^(.+)\\([^\\]+)$") or not (string.find)((string.lower)(l_0_7), (string.lower)(l_0_5:match("^(.+)\\([^\\]+)$")), 1, true) then
        return mp.CLEAN
      end
      if not l_0_8 then
        l_0_8 = l_0_4
      end
      do
        local l_0_9, l_0_10 = , l_0_5 or l_0_5
        ;
        (bm.add_related_file)(l_0_4)
        ;
        (bm.add_related_string)("SuspiciousDLL", l_0_4, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end

