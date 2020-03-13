//
//  CommonAssembly
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright (c) 2020 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class CommonAssembly: Assembly {
	
	public func assemble(container: Container) {
		container.register(IAppRouter.self) { _ in
			AppRouter.shared
		}

		/*
		 | Register your manager here, ex :
		 |
		 | container.register(ISampleManager.self) {(r) in
		 |	    return SampleManager()
		 | }
		 */
	}
}
