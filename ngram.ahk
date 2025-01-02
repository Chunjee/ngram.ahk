class ngram {

	; --- Static Methods ---
	/**
	 * Generates n-grams from an array of elements or a string.
	 * @class ngram
	 * @method generate
	 * @param {(Array|string)} paramArray - The input array or string to generate n-grams from. 
	 *                                      If a string is provided, it will be split using `paramSeparator`.
	 * @param {(number|Array<number>)} [paramSize=1] - The size of the n-grams to generate.
	 *                                                 If an array of numbers is provided, n-grams of each size are generated.
	 * @param {string} [paramSeparator=""] - The delimiter to use when splitting a string into an array. 
	 *                                       Ignored if `paramArray` is already an array.
	 * @returns {Array<Array<any>>} An array of n-grams, where each n-gram is an array of elements from the input.
	 */
	generate(paramArray, paramSize := 1, paramSeparator := "") {
		if (!isObject(paramArray)) {
			paramArray := strSplit(paramArray, paramSeparator)
		}

		ngrams := []
		if (isObject(paramSize)) {
			for key, value in paramSize {
				ngrams.push(this.generate(paramArray, value, paramSeparator))
			}
		} else {
			arraySize := paramArray.count()
			ngrams.setCapacity(arraySize)

			maxIndex := arraySize - paramSize + 1
			loop, % maxIndex {
				currentIndex := A_Index
				subArray := []
				subArray.setCapacity(paramSize)

				loop, % paramSize {
					offset := A_Index - 1
					subArray.push(paramArray[currentIndex + offset])
				}
				ngrams.push(subArray)
			}
		}
		return ngrams
	}
}
