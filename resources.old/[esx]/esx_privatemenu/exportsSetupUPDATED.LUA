You need to add the following lines to BOTTOM your files.
You need to add the following lines to BOTTOM your files.
You need to add the following lines to BOTTOM your files.
You need to add the following lines to BOTTOM your files.
You need to add the following lines to BOTTOM your files.
You need to add the following lines to BOTTOM your files.

============================================
==      esx_mechanicjob/__resource.lua      ==  
==				          ADD                   == 
============================================

exports {
  'OpenMechanicActionsMenu',
  'OpenMobileMechanicActionsMenu'
}


============================================
==       esx_taxijob/__resource.lua       ==  
==			      ADD/REPLACE                 == 
============================================

exports {
  'OpenMobileTaxiActionsMenu',
  'OpenTaxiActionsMenu'
}


============================================
==      esx_policejob/__resource.lua      ==  
==				    ADD/REPLACE                 == 
============================================

exports {
  'getJob',
  'OpenPoliceActionsMenu'
}

============================================
==     esx_policejob/client/main.lua      ==  
==				 ADD/REPLACE AT BOTTOM          == 
============================================

function getJob()
  if PlayerData.job ~= nil then
	return PlayerData.job.name
  end
end


============================================
==      esx_animations/client/main.lua    ==  
==				          ADD                   == 
============================================

function openAnimations()
  OpenAnimationsMenu()
end

============================================
==       esx_animations/__resource.lua    ==  
==				          ADD                   == 
============================================

exports {
  'openAnimations'
}


============================================
==       esx_voice/__resource.lua         ==  
==				          ADD                   == 
============================================

exports {
  'setVoice'
}

============================================
==      esx_voice/client/main.lua         ==  
==				          ADD                   == 
============================================

function setVoice()
      voice.current = (voice.current + 1) % 3
      if voice.current == 0 then
        NetworkSetTalkerProximity(voice.default)
        voice.level = "Normal"
      elseif voice.current == 1 then
        NetworkSetTalkerProximity(voice.shout)
        voice.level = "Shout"
      elseif voice.current == 2 then
        NetworkSetTalkerProximity(voice.whisper)
        voice.level = "Whisper"
      end
end


============================================
==       esx_identity/__resource.lua      ==  
==				          ADD                   == 
============================================

exports {
  'openRegistry'
}

============================================
==      esx_identity/client/main.lua      ==  
==				          ADD                   == 
============================================

function openRegistry()
  TriggerEvent('esx_identity:showRegisterIdentity')
end

============================================
==        esx_billing/__resource.lua      ==
==				          ADD                   == 
============================================

exports {
  'ShowBillsMenu'
}