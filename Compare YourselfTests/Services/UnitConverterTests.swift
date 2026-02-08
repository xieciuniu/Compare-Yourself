//
//  UnitConverterTests.swift
//  Compare YourselfTests
//
//  Created by Hubert Wojtowicz on 07/02/2026.
//

import Testing
@testable import Compare_Yourself

struct UnitConverterTests {

    @Test func inchesToCm() async throws {
        // Given
        let inches = 10.0
        
        // When
        let result = await UnitConverter.inchesToCentimeters(inches)
        
        // Then
        #expect(result == 25.4, "Failed to convert 10 inches to 25.4 cm")
    }

}
