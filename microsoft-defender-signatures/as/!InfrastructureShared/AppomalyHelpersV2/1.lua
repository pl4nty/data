-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AppomalyHelpersV2\1.luac 

-- params : ...
-- function num : 0
getCmdKeywordsWeightV2 = function()
  -- function num : 0_0
  local l_1_0 = {}
  l_1_0["%[io.file%]::writeallbytes"] = 5
  l_1_0["system.reflection.assembly"] = 15
  l_1_0["iisy.invoke"] = 5
  l_1_0.tcplistener = 5
  l_1_0.accepttcpclient = 5
  l_1_0.tcpclient = 5
  l_1_0.downloadstring = 10
  l_1_0.uploadfile = 10
  l_1_0["send-mailmessage"] = 0
  l_1_0["[^r]shell[^.]"] = 5
  l_1_0.defender = 20
  l_1_0["disable.*true"] = 5
  l_1_0["disable.*0"] = 5
  l_1_0.stop = 5
  l_1_0.remove = 5
  l_1_0.exclusion = 1
  l_1_0.sense = 1
  l_1_0.scriptblock = 5
  l_1_0.webrequest = 5
  l_1_0["user%-agent"] = 10
  l_1_0.webclient = 5
  l_1_0["unicode.getstring"] = 5
  l_1_0.whoami = 1
  l_1_0["net user"] = 1
  l_1_0["bitsadmin.*http"] = 5
  l_1_0["certutil.*http"] = 5
  l_1_0["invoke%-webrequest"] = 5
  l_1_0["invoke%-restmethod"] = 5
  l_1_0.curl = 6
  l_1_0.wget = 5
  l_1_0["new%-localuser"] = 5
  l_1_0["net group /add"] = 5
  l_1_0["new%-localgroup"] = 5
  l_1_0.icacls = 1
  l_1_0["set%-acl"] = 1
  l_1_0["set%-itemproperty"] = 1
  l_1_0["set%-mppreference"] = 5
  l_1_0["add%-mppreference"] = 5
  l_1_0.netstat = 1
  l_1_0.nmap = 1
  l_1_0.runas = 5
  l_1_0["enable%-privilege"] = 5
  l_1_0.psexec = 5
  l_1_0["invoke%-command"] = 5
  l_1_0.taskkill = 1
  l_1_0["stop%-process"] = 5
  l_1_0["reg add"] = 1
  l_1_0["set%-itemproperty.*disable"] = 2
  l_1_0["[^by]pass"] = 2
  l_1_0.password = 2
  l_1_0["invoke%-expression"] = 5
  l_1_0.dllimport = 10
  l_1_0["using system%.runtime"] = 5
  l_1_0["scripting.filesystemobject"] = 5
  l_1_0["http://"] = 1
  l_1_0["https://"] = 1
  l_1_0["start%-sleep"] = 2
  l_1_0["windowsinstaller.installer.*installproduct"] = 1
  l_1_0["%-uri"] = 1
  l_1_0["%-body"] = 1
  l_1_0["%-content-type"] = 1
  l_1_0.tanium = -60
  l_1_0.ansible = -60
  l_1_0["synchash.devmode"] = -60
  return l_1_0
end


