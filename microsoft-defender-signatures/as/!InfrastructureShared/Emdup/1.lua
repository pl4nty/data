-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Emdup\1.luac 

-- params : ...
-- function num : 0
if (Remediation.Threat).Name == "Virus:Win32/Emdup.A" then
  for l_0_3,l_0_4 in ipairs((Remediation.Threat).Resources) do
    if l_0_4.Schema == "file" then
      local l_0_5, l_0_6, l_0_7, l_0_8 = Infrastructure_SplitThreatPath(l_0_4.Path)
      if l_0_5 and l_0_7 then
        local l_0_9 = nil
        if l_0_8 then
          l_0_9 = (string.sub)(l_0_7, 1, -#l_0_8 - 2)
        else
          l_0_9 = l_0_7
        end
        local l_0_10 = l_0_5 .. l_0_9 .. ".cab"
        ;
        (sysio.MoveFile)(l_0_10, l_0_4.Path)
        ;
        (sysio.SetFileAttributes)(l_0_4.Path, 128)
      end
    end
  end
end

