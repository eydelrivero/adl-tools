
		<?php
		$active[$current] = 'class="active"';
		?>
		<img src="http://www.openehr.org/gui/ADLlogo.png" style="height:110px;">
		<ul>
			<li><a href="home" <?php if($pageOn == 'home.php'){?> class="active"<?php }?>>ADL WB Home</a></li>
			<li><a href="gettingstarted" <?php if($pageOn == 'gettingstarted.php'){?> class="active"<?php }?>>Getting Started</a></li>
			<li><a href="obtainingarchetypes" <?php if($pageOn == 'obtainingarchetypes.php'){?> class="active"<?php }?>>Obtaining Archetypes</a></li>
			<li><a href="browsingandcompiling" <?php if($pageOn == 'browsingandcompiling.php'){?> class="active"<?php }?>>Browsing and Compiling</a></li>
			<li><a href="toolconfiguration" <?php if($pageOn == 'toolconfiguration.php'){?> class="active"<?php }?>>Tool Configuration</a></li>
			<li><a href="learningabout" <?php if($pageOn == 'learningabout.php'){?> class="active"<?php }?>>About ADL 1.5</a></li>
			<li><a href="workingwithtemplates" <?php if($pageOn == 'workingwithtemplates.php'){?> class="active"<?php }?>>Working with Templates</a></li>
			<li><a href="testtool" <?php if($pageOn == 'testtool.php'){?> class="active"<?php }?>>The Test Tool</a></li>
			<li><a href="en13606" <?php if($pageOn == 'en13606.php'){?> class="active"<?php }?>>EN 13606</a></li>
			<li><a href="supportandcontributing" <?php if($pageOn == 'supportandcontributing.php'){?> class="active"<?php }?>>Support and Contributing</a></li>
			<li><a href="installationnotes" <?php if($pageOn == 'installationnotes.php'){?> class="active"<?php }?>>Installation Notes</a></li>
			<li><a href="releasenotes" <?php if($pageOn == 'releasenotes.php'){?> class="active"<?php }?>>Release Notes</a></li>
		</ul>
		<br/>
		<a href="http://www.openehr.org/downloads/modellingtools">>> Back to Modelling Tools</a>
